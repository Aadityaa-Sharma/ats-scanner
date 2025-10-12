# Resume ATS Analyzer - Deployment Guide

## 🚀 Render Deployment

This project is configured for easy deployment on Render.com.

### Prerequisites
- GitHub repository with your code
- Render.com account

### Deployment Steps

1. **Connect to Render**
   - Go to [render.com](https://render.com)
   - Sign up/Login with your GitHub account
   - Click "New +" → "Web Service"

2. **Configure the Service**
   - Connect your GitHub repository
   - Use these settings:
     - **Name**: `resume-ats-analyzer` (or your preferred name)
     - **Environment**: `Python 3`
     - **Build Command**: `pip install -r requirements.txt`
     - **Start Command**: `gunicorn --bind 0.0.0.0:$PORT --workers 2 --timeout 120 app:app`
     - **Plan**: Free (or paid for better performance)

3. **Environment Variables**
   Set these in Render dashboard:
   - `PORT`: `10000` (Render will override this)
   - `CORS_ORIGIN`: `https://your-app-name.onrender.com`

4. **Deploy**
   - Click "Create Web Service"
   - Render will automatically build and deploy your app
   - Your app will be available at `https://your-app-name.onrender.com`

### Alternative: Using render.yaml

If you prefer using the `render.yaml` configuration file:
1. Push your code with `render.yaml` to GitHub
2. In Render dashboard, select "Infrastructure as Code"
3. Connect your repository
4. Render will automatically detect and use the `render.yaml` configuration

### File Structure for Deployment

```
resume-ats-analyzer/
├── app.py                 # Main Flask application
├── advanced_resume_analyzer.py  # Resume analysis logic
├── index.html            # Frontend interface
├── requirements.txt      # Python dependencies
├── render.yaml          # Render configuration
├── Procfile            # Alternative deployment config
├── start.sh            # Startup script
├── uploads/            # File upload directory (auto-created)
└── reports/            # Analysis reports directory (auto-created)
```

### Health Check

The application includes a health check endpoint at `/health` that Render will use to monitor the service.

### Troubleshooting

1. **Build Failures**
   - Check that all dependencies are in `requirements.txt`
   - Ensure Python version compatibility

2. **Runtime Errors**
   - Check Render logs for detailed error messages
   - Verify environment variables are set correctly

3. **CORS Issues**
   - Update `CORS_ORIGIN` environment variable with your actual domain
   - Check that the frontend URL matches the CORS configuration

### Performance Notes

- Free tier has limitations on CPU and memory
- Consider upgrading to paid plan for production use
- Files are stored temporarily and cleaned up after analysis
- Maximum file size is 10MB

### Security Considerations

- File uploads are validated for type and size
- Temporary files are automatically cleaned up
- CORS is configured to restrict origins
- No sensitive data is stored permanently

## 🔗 Integration

The "Back to Career Elevator" button now correctly redirects to `https://career-elevator.vercel.app`.

## 📞 Support

For deployment issues, check:
1. Render service logs
2. Application health endpoint: `https://your-app.onrender.com/health`
3. Browser console for frontend errors
